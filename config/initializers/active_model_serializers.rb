#initializers/active_model_serializers.rb
ActiveSupport.on_load(:active_model_serializers) do
  ActiveModel::ArraySerializer.root = true
  ActiveModel::Serializer.root = true
  ActiveRecord::Base.include_root_in_json = true
end