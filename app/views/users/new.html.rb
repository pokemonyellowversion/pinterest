<h1>Sign Up</h1>
<%= form_for @user do |f| %>
  <% if @user.errors.any? %>
    <div class="error_messages">
      <h2>Form is invalid</h2>
      <ul>
        <% for message in @user.errors.full_messages %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <div class="field">
    <%= f.label :name %>
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :email %>
    <%= f.text_field :email %>
  </div>
  <div class="field">
    <%= f.label :password %>
    <%= f.password_field :password %>
  </div>
  <div class="field">
    <%= f.label :password_confirmation %>
    <%= f.password_field :password_confirmation %>
  </div>
  <div class="actions"><%= f.submit %></div>
<% end %>