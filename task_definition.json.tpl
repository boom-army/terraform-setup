[
  {
    "essential": true,
    "name": "sosol-app",
    "image": "${REPOSITORY_URL}",
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${CLOUDWATCH_GROUP}",
        "awslogs-region": "${AWS_REGION}",
        "awslogs-stream-prefix": "ecs"
      }
    },
    "portMappings": [
      {
        "containerPort": ${SOSOL_PORT},
        "hostPort": ${SOSOL_PORT},
        "protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name": "DATABASE_URL",
        "value": "${DATABASE_URL}"
      },
      {
        "name": "SOSOL_PORT",
        "value": "${SOSOL_PORT}"
      },
      {
        "name": "NODE_ENV",
        "value": "${NODE_ENV}"
      },
      {
        "name": "JWT_SECRET",
        "value": "${JWT_SECRET}"
      },
      {
        "name": "AWS_ACCESS_KEY_ID",
        "value": "${AWS_ACCESS_KEY_ID}"
      },
      {
        "name": "AWS_SECRET_KEY",
        "value": "${AWS_SECRET_KEY}"
      },
      {
        "name": "AWS_BUCKET_NAME",
        "value": "${AWS_BUCKET_NAME}"
      },
      {
        "name": "AWS_REGION",
        "value": "${AWS_REGION}"
      },
      {
        "name": "ONESIGNAL_APP_ID",
        "value": "${ONESIGNAL_APP_ID}"
      },
      {
        "name": "ONESIGNAL_API_KEY",
        "value": "${ONESIGNAL_API_KEY}"
      },
      {
        "name": "CORS_ORIGIN",
        "value": "${CORS_ORIGIN}"
      },
      {
        "name": "SENTRY_DSN",
        "value": "${SENTRY_DSN}"
      }
    ]
  }
]
