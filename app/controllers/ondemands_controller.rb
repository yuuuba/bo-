class OndemandsController < ApplicationController
  before_action :set_ondemand, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
  end

  def show
    # @ondemand_tags = @ondemand.ondemand_tags
    #TODO カテゴリー正しくid渡るよう修正↓
    #@ondemand_category = params[:id]
  end

  def new
    @ondemand = Ondemand.new
    @ondemand_category = OndemandCategory.new
    @ondemand_tag = OndemandTag.new
    @attitude = Attitude.new
    @charm = Charm.new
    @note = Note.new
  end

  def edit
  end

  def create
    @ondemand = Ondemand.new(
      title:params[:ondemand][:title],
      body:params[:ondemand][:body],
      user_id:current_user.id
    )

    @attitude = Attitude.new(attitude_params)

    @ondemand_category = OndemandCategory.new(ondemand_category_params)

    @ondemand_tag = OndemandTag.new(ondemand_tag_params)

    @charm = Charm.new(charm_params)
    
    @note = Note.new(note_params)

    tag_list = params[:ondemand_tag][:name].split(/( |　)+/).delete_if{|x| x == /( |　)+/}

    if @ondemand.save! && @ondemand_category.save! && @ondemand_tag.save! && @attitude.save! && @charm.save! && @note.save!
      @ondemand.save_tag(tag_list)
      redirect_to ondemand_path(@ondemand.id)
    end
  end

  def update
    if @ondemand.update(ondemand_params)
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

    def attitude_params
      params.require(:attitude).permit(:serious, :loose)
    end

    def charm_params
      params.require(:charm).permit(:influential_person, :welcome_beginner, :body)
    end

    def note_params
      params.require(:note).permit(:minimum_requirement, :prohibited)
    end
end
