# Generated by curation_concerns:models:install
class FileSet < ActiveFedora::Base
  include ::Hyrax::FileSetBehavior
  self.indexer = FileSetIndexer
end
