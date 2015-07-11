module Rhost
  class Post < ActiveRecord::Base

    validates :title, :presence => true
    validates :slug, :presence => true, :uniqueness => true

    before_validation do
      if self.title.is_a?(String) && self.slug.blank?
        self.slug = self.title.parameterize
      end
    end

    def published?
      !!self.published_at
    end

    def draft?
      self.published_at.nil?
    end

  end
end
