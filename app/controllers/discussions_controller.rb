class DiscussionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @new_discussion = Discussion.new(discussion_params)
    @new_discussion.update_attributes(:post_id => @post.id, :user_id => current_user.id)
    if @new_discussion.save
      redirect_to subject_group_post_path(@subject, @group, @post)
    else
      flash[:error] = @new_discussion.errors.full_messages.to_sentence
      redirect_to subject_group_post_path(@subject, @group, @post)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def discussion_params
    params.require(:discussion).permit(:content)
  end
end
