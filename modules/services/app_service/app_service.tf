

resource "azurerm_service_plan" "this" {
  name                = "${var.name}-asp"
  location            = var.rg_location
  resource_group_name = var.rg_name
  os_type             = "Linux"
  sku_name            = "${var.sku_tier}${var.sku_size}"
}

resource "azurerm_linux_web_app" "this" {
  name                = "${var.name}-as"
  location            = var.rg_location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.this.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = var.always_on

    dynamic "application_stack" {
      for_each = [var.application_stack]
      content {
        java_version        = lookup(application_stack.value, "java_version", null)
        java_server         = lookup(application_stack.value, "java_server", null)
        java_server_version = lookup(application_stack.value, "java_server_version", null)
        node_version        = lookup(application_stack.value, "node_version", null)
        python_version      = lookup(application_stack.value, "python_version", null)
        dotnet_version      = lookup(application_stack.value, "dotnet_version", null)
        php_version         = lookup(application_stack.value, "php_version", null)
        ruby_version        = lookup(application_stack.value, "ruby_version", null)
        go_version          = lookup(application_stack.value, "go_version", null)
        # # Custom container
        # docker_image     = lookup(application_stack.value, "docker_image", null)
        # docker_image_tag = lookup(application_stack.value, "docker_tag", null)
      }
    }
  }

  app_settings = var.app_settings
}

