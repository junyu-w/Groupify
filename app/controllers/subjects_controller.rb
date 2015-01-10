class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
  end

  def create
    @new_subject = Subject.new(subject_params)
    @new_subject.instructor_list.push(current_user.id);
    if @new_subject.save
      current_user.subject_id_list.push(@new_subject.id)
      current_user.save
      redirect_to subjects_path
    else
      flash[:error] = @new_subject.errors.full_messages.to_sentence
      redirect_to subjects_path
    end
  end

  def edit
  end

  def update
    @subject = Subject.find(params[:id])
    if current_user.is_student == true
      @subject.student_list.push(current_user.id)
    end
    if current_user.is_instructor == true
      @subject.instructor_list.push(current_user.id)
    end
    current_user.subject_id_list.push(@subject.id)
    if @subject.save and current_user.save
      redirect_to subject_groups_path(@subject.id)
    else
      flash[:error] = @subject.errors.full_messages.to_sentence
      flash[:error] = current_user.errors.full_messages.to_sentence
      redirect_to subjects_path
    end
  end

  def destroy
  end

  def activate
  end

  def deactivate
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description)
  end
end
