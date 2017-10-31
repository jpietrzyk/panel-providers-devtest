# In future we should create evaluation model to store evaluation results
class EvaluationResult
  include ActiveModel::Serialization
  include ActiveModel::Model
  attr_accessor :price
end
