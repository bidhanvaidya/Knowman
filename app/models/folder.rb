class Folder < ActiveRecord::Base
has_many :topics

accepts_nested_attributes_for :topics, :allow_destroy => true
has_many :notifications





end
