Rails.application.routes.draw do
  get 'examples/confirmation' => 'examples#confirmation'
  get 'examples/confirmed' => 'examples#confirmed'
end
