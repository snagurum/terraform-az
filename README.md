# terraform-az


# Azure Virtual Network (VNet) Terraform Module

This Terraform module provisions an **Azure Virtual Network (VNet)** along with **public** and **private** subnets.  
It also configures **Network Security Groups (NSGs)** and allows defining custom ingress rules for each subnet.

---

## ## Features

- Creates an Azure Virtual Network  
- Creates **public** and **private** subnets  
- Configurable **ingress rules** for each subnet  
- Creates and attaches Network Security Groups  
- Exposes VNet and subnet outputs  
- Simple reusable module for Azure networking

---


## 🗺 Architecture (ASCII Diagram)

```text
+-----------------------------+
|       Resource Group        |
+--------------+--------------+
               |
               v
       +----------------+
       |     VNet       |
       +--------+-------+
                |
     +----------+-----------+
     |                      |
     v                      v
+-----------+        +-------------+
| Public    |        | Private     |
| Subnet    |        | Subnet      |
+-----+-----+        +------+------+
      |                      |
      v                      v
+-----------+        +-------------+
| Public    |        | Private     |
|   NSG     |        |    NSG      |
+-----------+        +-------------+
```
---

## 📦 Usage

```hcl
module "vnet" {
  source = "./modules/vnet"

  resource_group_name = "rg-demo"
  name                = "demo"
  location            = "eastus"

  address_space         = ["10.0.0.0/16"]
  public_address_space  = ["10.0.1.0/24"]
  private_address_space = ["10.0.2.0/24"]

  public_ingress_rules = [
    {
      name                       = "Allow-HTTP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  private_ingress_rules = [
    {
      name                       = "SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}
```
