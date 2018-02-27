### Override View for each models or globally

Example: I wanna overrride the new view for my model `page`

In `app/views/slash_admin/models/pages/_data_new.html.erb` : (the default one)

```erb
<%= form_for [:slash_admin, @model] do |f| %>
  <%= render 'slash_admin/shared/errors_data_new' %>

  <% params.each do |a| %>
    <%= render 'slash_admin/fields/form_group', f: f, a: a %>
  <% end %>

  <%= render 'slash_admin/shared/new_form_buttons' %>
<% end %>
```

(note: `params` is `update_params` from model controller)

Example of adding column system:

```erb
<%= form_for [:slash_admin, @model] do |f| %>
  <%= render 'slash_admin/shared/errors_data_new' %>

  <div class="row">
    <div class="col-sm-6">
      <%= render 'slash_admin/fields/form_group', f: f, a: :title %>
    </div>
    <div class="col-sm-6">
      <%= render 'slash_admin/fields/form_group', f: f, a: :content %>
    </div>
  </div>

  <%= render 'slash_admin/shared/new_form_buttons' %>
<% end %>
```

Be careful, for custom type:

```erb
  <%= render 'slash_admin/fields/form_group', f: f, a: {my_color_field: {type: :color}} %>
```
