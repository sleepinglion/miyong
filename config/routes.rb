Rails.application.routes.draw do
  root 'home#index'
   mount Ckeditor::Engine => '/ckeditor'

   devise_for :users, :controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
     get '/users', :to => 'users/registrations#index'
     get '/login', :to => 'users/sessions#new'
   end

   namespace :admin do
     resources :intro, :menus, :notices, :gallery_categories, :galleries, :faq_categories,:faqs, :guest_books
     resources :questions do
       resources :question_answers
     end
   end

   resources :gallery_categories, :galleries, :site

   namespace :intro do
     resources :intro
     resources :histories
     resources :location
   end

   resources :products do
     resources :product_comments
   end

   namespace :customer_center do
     resources :notices
     resources :faq_categories
     resources :faqs

     resources :questions do
       resources :question_comments
     end

     resources :guest_books do
       resources :guest_book_comments
     end
   end
end
