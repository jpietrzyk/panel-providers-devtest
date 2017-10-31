module API
  module Entities
    class Evaluation < Grape::Entity
      evaluate :price, documentation: { type: "String", desc: "Evaluation price." }
    end
  end
end
