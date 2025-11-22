# ActionText Configuration for Rails 7.1+
# Configure sanitizer to allow specific HTML tags and attributes

# Note: ActionText sanitization is configured via
# config/initializers/content_security_policy.rb
# for Rails 7+

# Standard allowed tags for rich text content
# Tags like <p>, <div>, <strong>, <em>, <a>, <img>, etc. are safe

# Allow image attachments in rich text
ActionText::Attachment.tag_name = "action-text-attachment"
