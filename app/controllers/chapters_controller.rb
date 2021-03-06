class ChaptersController < ApplicationController
  before_filter :require_course_permission
  before_filter :require_teacher, :except => [:show]
  prepend_before_filter :find_course,  
                        :only   => [:index, :new, :create]
  prepend_before_filter :find_chapter, 
                        :except => [:index, :new, :create]

  def index
    @chapters = @course.chapters.order(:name)
  end

  def show
    @assignments = @chapter.assignments.order(:name)
  end

  def new
    @chapter = Chapter.new
    @chapter.course_id = @course.id
  end

  def edit
  end

  def create
    @chapter = Chapter.new(chapter_params)

    if @chapter.save
      redirect_to @chapter, notice: 'Chapter was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @chapter.update_attributes(chapter_params)
      redirect_to @chapter, notice: 'Chapter was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @chapter.destroy
    redirect_to course_chapters_url(@course)
  end

  private

  def find_chapter
    @chapter = Chapter.find(params[:id])
    @course  = @chapter.course or raise Exception.new("Invalid Chapter Object")
  end

  def chapter_params
    params[:chapter].permit(:course_id, :name)
  end
end
