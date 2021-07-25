class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save!
    flash[:success] = "タスクを登録しました。"
    redirect_to tasks_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:danger] = "タスクが登録できませんでした。"
    render :new
  rescue => e
    flash.now[:danger] = "タスクの登録に失敗しました。初めからやり直して下さい。"
    render :new
  end

  def show
  end

  def edit
  end

  def update
    @task.update!(task_params)
    flash[:success] = "タスクを更新しました。"
    redirect_to tasks_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:danger] = "タスクが更新できませんでした。"
    render :edit
  rescue => e
    flash.now[:danger] = "タスクの登録に失敗しました。初めからやり直して下さい。"
    render :edit
  end

  def destroy
    @task.destroy!
    flash[:success] = "タスクを削除しました。"
    redirect_to tasks_path
  rescue => e
    flash[:danger] = "タスクを削除できませんでした。"
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :content, :status, :deadline)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
