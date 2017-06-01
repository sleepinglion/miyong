class ApplicationController < ActionController::Base  
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_ad, only: [:index, :show]

  def initialize(*params)
    super(*params)

    @title=t(:application_name)

    @application_name=t(:application_name)
    @controller_name=t(:application_name)

    @meta_robot='all, index, follow'
    @meta_description=t(:meta_description)
    @meta_keyword=t(:meta_keyword)

    @style='application'
    @script='application'

    @resources = Resource.where(:enable=>true).where(:menu_display=>true).order([:priority,:id])

    @menu_setting=nil
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
   # I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  #def extract_locale_from_tld
  #  parsed_locale = request.host.split('.').last
  #  I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  #end

  #def default_url_options(options={})
  #  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  #  { locale: I18n.locale }
  #end

  protected

  def set_ad
    @ad=true
  end

  def get_menu(menu)
    @menu_setting=Resource.where(:controller=>menu).first
  end
end
