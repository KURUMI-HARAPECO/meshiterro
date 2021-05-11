Rails.application.routes.draw do
root to: 'homes#top'
devise_for :users
resources :post_images, only: [:new, :create, :index, :show, :destroy]do
    resource :favorites, only: [:create, :destroy]
    # 今まではresourcesでしたが、ここでは、resourceとなっている点に注目してください。
    # 単数にすると、そのコントローラのidがリクエストに含まれなくなります。
    resources :post_comments, only: [:create, :destroy]
  end
resources :users, only: [:show, :edit, :update]
#only 不必要なルーティングが生成されるのを制限
end
