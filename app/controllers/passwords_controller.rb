class PasswordsController < ApplicationController
  def index
    @passwords = Password.all
  end

  def show
    @password = Password.find(params[:id])
  end

  def new
    @password = Password.new
  end

  def create
    @password = Password.new(password_params)
    if @password.valid?
      @password.content = PronouncablePasswordGenerator.generate(
        case_option: @password.case_option,
        add_non_letter: @password.add_non_letter,
        length: @password.length,
        non_letter_count: @password.non_letter_count
      )
      if @password.save
        redirect_to passwords_path, notice: 'Password was successfully created.'
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @password = Password.find(params[:id])
  end

  def update
    @password = Password.find(params[:id])
    if @password.update(password_params)
      @password.content = PronouncablePasswordGenerator.generate(
        case_option: @password.case_option,
        add_non_letter: @password.add_non_letter,
        length: @password.length,
        non_letter_count: @password.non_letter_count
      )
      if @password.save
        redirect_to passwords_path
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    @password = Password.find(params[:id])
    @password.destroy
    redirect_to passwords_path
  end

  def clear_all
    Password.destroy_all
    redirect_to passwords_path
  end

  private

  def password_params
    params.require(:password).permit(:length, :case_option, :add_non_letter, :non_letter_count)
  end
end