class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @subject = Subject.find(params[:subject_id])
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @new_topic = Topic.new(topic_params)
    @new_topic.update_attributes(:subject_id => @subject.id)
    if @new_topic.save
      redirect_to subject_groups_path(@subject)
    else
      flash[:error] = @new_topic.errors.full_messages.to_sentence
      redirect_to subject_groups_path(@subject)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end
