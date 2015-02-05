class GroupsController < ApplicationController
  def index
    @subject = Subject.find(params[:subject_id])
    @instructors = @subject.instructor_list
    @groups = Group.where(subject_id: @subject.id)
    @topics = Topic.where(subject_id: @subject.id)
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:id])
    @topic = Topic.find(@group.topic_id)
    @posts = Post.where(group_id: @group.id)
  end

  def new
    @subject = Subject.find(params[:subject_id])
    if @subject.topics.length == 0
      flash[:error] = "Please create topics first"
      redirect_to subject_groups_path(@subject)
    end
    if @subject.topics.length == @subject.groups.length
      flash[:error] = "Please create more topics"
      redirect_to subject_groups_path(@subject)
    end
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @topic = Topic.find_by(id: params[:group][:topic_id])
    @new_group = Group.new(group_params)
    @new_group.update_attributes(:subject_id => @subject.id)
    if @new_group.save
      @topic.update_attributes(:group_id => @new_group.id)
      redirect_to subject_groups_path(@subject)
    else
      flash[:error] = @new_group.errors.full_messages.to_sentence
      redirect_to subject_groups_path(@subject)
    end
  end

  def edit
  end

  def update
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:id])
    @group.student_list.push(current_user.id)
    if @group.save
      redirect_to subject_group_posts_path(@subject, @group)
    else
      flash[:error] = @group.errors.full_messages.to_sentence
      redirect_to subject_group_path(@subject, @group)
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    @group.destroy
    redirect_to subject_groups_path(@subject)
  end

  private

  def group_params
    params.require(:group).permit(:name, :topic_id)
  end
end
