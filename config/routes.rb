Rails.application.routes.draw do
  root  to: "dashboard#show"

  match 'dashboard/show' => 'dashboard#show', via: [:get, :post]
end

