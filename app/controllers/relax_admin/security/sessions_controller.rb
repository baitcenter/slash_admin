# frozen_string_literal: true
module RelaxAdmin
  class Security::SessionsController < ActionController::Base
    layout 'relax_admin/admin_user'

    def new
    end

    def create
      admin = Admin.where('username = :value OR lower(email) = lower(:value)', value: params[:admin][:login]).first
      if admin&.authenticate(params[:admin][:password])
        session[:admin_id] = admin.id
        flash[:notice] = 'Vous êtes à présent connecté.'
        redirect_to relax_admin.dashboard_path
      else
        @error_messages = 'Merci de vérifier vos identifiants'
        render :new and return
      end
    end

    def destroy
      session[:admin_id] = nil
      flash[:notice] = 'Déconnecté avec succès.'
      redirect_to relax_admin.login_url
    end
  end
end
