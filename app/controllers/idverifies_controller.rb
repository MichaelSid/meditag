class IdverifiesController < ApplicationController

  def new
    @uuid = params['tag-uuid']
  end
end
