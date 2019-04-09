class Api::V1::AuthsController < ApplicationController
    before_action :authenticate_user!, except: [:reset_password]
end
