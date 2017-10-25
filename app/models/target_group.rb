class TargetGroup < ActiveRecord::Base
  extend ActsAsTree::TreeView

  acts_as_tree order: 'name'
  
  belongs_to :panel_provider
  validates :name, :panel_provider, presence: true
end
