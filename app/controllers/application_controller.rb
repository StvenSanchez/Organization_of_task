class ApplicationController < ActionController::Base
    before_action :authenticate_user! ## Helper que verifica si hay una sesion activa, si no hay redirige al login 
end
