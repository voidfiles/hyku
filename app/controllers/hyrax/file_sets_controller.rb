module Hyrax
  class FileSetsController < ApplicationController
    include Hyrax::FileSetsControllerBehavior
    include Hyrax::FileSetsControllerBehavior
    self.show_presenter = Hyku::FileSetPresenter
  end
end
