class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  before_save :encrypt_content
  after_find :decrypt_content

  validates :content, presence: true


  private

  def encrypt_content
    self.content = MessageEncryptor.encrypt(content) if content_changed?
  end

  def decrypt_content
    self.content = MessageEncryptor.decrypt(content)
  end
end
