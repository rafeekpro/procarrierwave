class Site < ActiveRecord::Base

	require 'carrierwave/orm/activerecord'

	attr_accessible :attachment
	validates_presence_of :attachment #use if the attribute is required
	mount_uploader :attachment, AttachmentUploader

end
