class ChannelGroup < ApplicationRecord
  belongs_to :channel
  belongs_to :groups
end
