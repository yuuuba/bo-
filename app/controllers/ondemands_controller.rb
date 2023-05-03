class OndemandsController < ApplicationController
  before_action :set_ondemand, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
  end

  def show
    @ondemand_tags = @ondemand.ondemand_tags
    #TODO カテゴリー正しくid渡るよう修正↓
    #@ondemand_category = params[:id]
  end

  def new
    @ondemand = Ondemand.new
    @ondemand_category = OndemandCategory.new
    @ondemand_tag = OndemandTag.new
    @ondemand_detail = OndemandDetail.new
    
    # 例:
    # grouped_options = {
    #   'North America' => [['United States','US'], 'Canada'],
    #   'Europe' => ['Denmark','Germany','France']
    # }
    
    # TODO: Hash で階層表現されたデータ構造を生成する (grouped_options_for_select に渡したい)
    ondemand_category_root_ids = OndemandCategory.root_categories.ids
    child_categories = OndemandCategory.where(parent_id: ondemand_category_root_ids)
    # temp_hash = {}
    # temp_hash.merge({root_category_name: 'foo', child_categories: []})
    # grouped_categories = ...

    # グループ化について:
    # もうひとつの方法...? : https://www.letitride.jp/entry/2020/06/15/161826
    # https://stackoverflow.com/questions/60841892/rewriting-an-activerecord-query-as-recursive-sql
  
    # 1. OndemandCategory.root_categories.ids で「親カテゴリ ID 群」が取得できる
    # 2. 「親カテゴリ ID 群」を持つ ID... 「サブカテゴリ」を検索する
    # 2-a. SQL の IN 句を使う...? Rails の構文では...?
    # 3. 「親カテゴリ」「サブカテゴリ」をそれぞれの ID によって紐付ける (Hash として作り上げる)
    # 3-a. group_by メソッドでグループ化 (parent_id で集合させる) できそう...? : https://ruby-doc.org/2.7.6/Enumerable.html#group_by-method
    # 4. (紐付けた状態を保ちつつ) View で利用可能な値・フォーマットに変換する
    # 5. 「4.」で作ったデータを View に渡す
  end

  def create
    ondemand = Ondemand.new(
      title:params[:ondemand][:title],
      body:params[:ondemand][:body],
      user_id:current_user.id,
      images:params[:ondemand][:images]
    )

    ondemand_category = OndemandCategory.new(ondemand_category_params)
    
    tag_list = params[:ondemand_tag][:name].split(/( |　)+/).delete_if { |x| x =~ /( |　)+/}
    raise RuntimeError if tag_list.empty?

    ondemand_detail = OndemandDetail.new(ondemand_detail_params)
    
    if ondemand.save! && ondemand_category.save! 
      ondemand.save_tag(tag_list)
    end

    if ondemand_detail.save!
      redirect_to ondemand_path(ondemand.id)
    end
  end

  def edit
    @ondemand_category = OndemandCategory.find(params[:id])
    @ondemand_tag = OndemandTag.find(params[:id])
    @ondemand_detail = OndemandDetail.find(params[:id])
  end

  def update
    @ondemand_category = OndemandCategory.find(params[:id])
    @ondemand_tag = OndemandTag.find(params[:id])
    @ondemand_detail = OndemandDetail.find(params[:id])
    
    if @ondemand.update(ondemand_params) && @ondemand_category.update(ondemand_category_params) && @ondemand_tag.update(ondemand_tag_params) && @ondemand_detail.update(ondemand_detail_params)
      redirect_to ondemand_path, notice: "編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    if @ondemand.destroy
      redirect_to ondemands_path, notice: "削除が完了しました"
    else
      flash.now[:danger] = "削除に失敗しました"
      render 'show'
    end
  end

  def tag_search
    @tag = OndemandTag.find(params[:ondemand_tag_id])
    @ondemands = @tag.ondemands.all
  end

  private

    def set_ondemand
      @ondemand = Ondemand.find(params[:id])
    end

    def ondemand_params
      params.require(:ondemand).permit(:title, :body, :user_id, images: [])
    end

    def ondemand_category_params
      params.require(:ondemand_category).permit(:name, :parent_id)
    end

    def ondemand_tag_params
      params.require(:ondemand_tag).permit(:name)
    end

    def ondemand_detail_params
      params.require(:ondemand_detail).permit(:place, :status, :mood, :charm, :member, :age_group, :cost, :item, :dress, :condition, :prohibition)
    end
end
