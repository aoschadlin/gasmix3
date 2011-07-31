class UsersController < ApplicationController
  def show
    sign_out_and_redirect root_path
  end
end