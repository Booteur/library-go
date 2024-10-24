# templates/_helpers.tpl

{{- define "libhelm.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "libhelm.labels" -}}
helm.sh/chart: {{ include "libhelm.chart" . }}
{{- with .Chart.AppVersion }}
app.kubernetes.io/version: {{ . }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "libhelm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "libhelm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "libhelm.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "libhelm.chart" -}}
{{- .Chart.Name }}-{{ .Chart.Version | replace "+" "_" -}}
{{- end -}}