module API
  module Entities
    class Location < Grape::Entity
      expose :name,
             documentation: { type: 'String', desc: 'Location name.' }
      expose :secret_code,
             documentation: { type: 'String',
                              desc: 'Secret code only for private access' },
             if: { scope: :private_access }
      expose :external_id,
             documentation: { type: 'String', desc: 'God knows what is that' },
             if: { scope: :private_access }
    end
  end
end
