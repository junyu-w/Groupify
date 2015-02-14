class PostsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @subject = Subject.find(params[:subject_id])
    #@topic = Topic.find(@group.topic_id)
    @topic = @group.topic
    @posts = Post.where(group_id: @group.id)
    @instructor_answer = @group.instructor_answer
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @discussions = Discussion.where(post_id: @post.id)
  end

  def new
  end

  def create
    @group = Group.find(params[:group_id])
    @subject = Subject.find(params[:subject_id])
    @new_post = Post.new(post_params)
    @new_post.update_attributes(:group_id => @group.id, :user_id => current_user.id)
    if @new_post.save
      redirect_to subject_group_post_path(@subject, @group, @new_post)
    else
      flash[:error] = @new_post.errors.full_messages.to_sentence
      redirect_to subject_group_post_path(@subject, @group)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def post_params
    params.require(:post).permit(:summary, :content)
  end
end
