class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(3)
  end
  
  def show
  end
  
  def edit
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新できませんでした'
      render :edit
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Task は正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は投稿されませんでした'
      render :new
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end

  def set_task
    @task = Task.find(params[:id])
  end
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status, :user)
  end

end