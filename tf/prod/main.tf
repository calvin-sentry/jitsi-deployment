locals {
  env = "sentry-health-sandbox"
}

resource helm_release ingress {
  name = "nginx"

  repository = "https://charts.helm.sh/stable"

  chart = "nginx-ingress"

  version      = ""
  force_update = true

  cleanup_on_fail = true

  set {
    name  = "rbac.create"
    value = true
  }

  set {
    name  = "podSecurityPolicy.enabled"
    value = true
  }

  set {
    name  = "controller.publishService.enabled"
    value = true
  }
}
