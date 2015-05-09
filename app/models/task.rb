class Task < ActiveRecord::Base
  belongs_to :client, polymorphic: true

  def global_client
    self.client.to_global_id if self.client.present?
  end

  def global_client=(client)
    self.client = GlobalID::Locator.locate client
  end
end
