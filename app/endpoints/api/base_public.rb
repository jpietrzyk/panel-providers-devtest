module API
  class BasePublic < Grape::API
    include API::BaseCommon
    mount API::Public::V1::Root
  end
end
