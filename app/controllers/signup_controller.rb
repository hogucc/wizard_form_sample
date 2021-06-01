class SignupController < ApplicationController
  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    @user = User.new
  end

  def step3
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    @user = User.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
    )

    if @user.save
      redirect_to done_signup_index_path
    else
      redirect_to done_signup_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
    )
  end
end
