class InstructorAnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:group_id])
    @topic = Topic.find(@group.topic_id)
    @new_instructor_answer = InstructorAnswer.new(instructor_answer_params)
    @new_instructor_answer.update_attributes(:topic_id => @topic.id, :group_id => @group.id, :user_id => current_user.id)
    if @new_instructor_answer.save
      @group.update_attributes(:instructor_answer_id => @new_instructor_answer.id)
      redirect_to subject_group_posts_path(@subject, @group)
    else
      flash[:error] = @new_instructor_answer.errors.full_messages.to_sentence
      redirect_to subject_group_posts_path(@subjects, @group)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def instructor_answer_params
    params.require(:instructor_answer).permit(:content)
  end
end
