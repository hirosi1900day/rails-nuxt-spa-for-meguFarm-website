class Api::V1::HelloController < ApplicationController
   def index
       render json: "hello"
   end
end
