maftest:
  BaseURLs:
    Apps: "http://apps"
    IplantEmail: "http://de-mailer"
    IplantGroups:
      Base: "http://iplant-groups"
      User: "${DE_GROUPER_USER}"
    JobStatusListener: "http://job-status-listener"
    Metadata: "http://metadata"
    Notifications: "http://notifications/v1"
    QMS: "http://qms"
  DE:
    AMQP:
      Host: "${AMQP_HOST}"
      Password: "${AMQP_PASS}"
      Port: 5672
      User: "${AMQP_USER}"
      Vhost: "${AMQP_VHOST}"
  DEDB:
    Host: "${DB_URL}"
    Name: "de"
    Password: "${DB_DE_PASS}"
    Port: 5432
    User: "${DB_DE_USER}"
  Docker:
    Tag: "latest"
  Email:
    SupportDest: ToDo
  IRODS:
    ExternalHost: "${IRODS_HOST}"
    Host: "${IRODS_HOST}"
    Password: "${IRODS_PASS}"
    User: "${IRODS_USER}"
    Zone: "${IRODS_ZONE}"
  Jobs:
    DataTransferImage: "discoenv/porklock"
    DataTransferTag: ToDo
  Keycloak:
    Realm: "${KEYCLOAK_REALM}"
    ServerURI: "${KEYCLOAK_URL}"
    VICE:
      ClientID: "${KEYCLOAK_CLIENT}"
      ClientSecret: "${KEYCLOAK_SEC}"
  Namespace: "qa"
  NewNotificationsDB:
    Host: "${DB_URL}"
    Name: "${DB_NOTIFICATION}"
    Password: "${DB_DE_PASS}"
    Port: 5432
    User: "${DB_DE_USER}"
  QMS:
    Enabled: true
  UIDDomain: ToDo
  VICE:
    BaseURI: ToDo
    DefaultBackend:
      LoadingPageTemplateString: ToDo
    FileTransfers:
      Image: "discoenv/vice-file-transfers"
      Tag: "latest"
    ImagePullSecret: "vice-image-pull-secret"
    UseCSIDriver: true
