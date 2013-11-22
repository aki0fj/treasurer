class Journal < ActiveRecord::Base
  validates_presence_of :occur_on , :message => "is required"
  validates_presence_of :deb_acc_cd , :message => "is required"
  validates_presence_of :cre_acc_cd , :message => "is required"
end
