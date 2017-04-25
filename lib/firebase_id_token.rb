require 'redis'
require 'redis-namespace'
require 'httparty'
require 'jwt'

require 'firebase_id_token/version'
require 'firebase_id_token/exceptions/no_certificates_error'
require 'firebase_id_token/exceptions/certificates_request_error'
require 'firebase_id_token/exceptions/certificates_ttl_error'
require 'firebase_id_token/configuration'
require 'firebase_id_token/certificates'
require 'firebase_id_token/signature'

# FirebaseIdToken::Certificates.request
# FirebaseIdToken::Certificates.request_anyway
# FirebaseIdToken::Certificates.present?
# FirebaseIdToken::Certificates.all
# FirebaseIdToken::Certificates.find(kid)
# FirebaseIdToken::Certificates.ttl
# FirebaseIdToken::Signature.verify(token)
module FirebaseIdToken
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield configuration
  end
end
