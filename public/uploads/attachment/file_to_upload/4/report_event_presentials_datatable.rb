class ReportEventPresentialsDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :t, :event_presential_admin_reports_path, :link_to, :content_tag

  def view_columns
    @view_columns ||= { 
      id: { source: "EventPresential.id", cond: :eq, searchable: false, orderable: true },
      name: { source: "EventPresential.name", cond: :like, searchable: true, orderable: true },
      event_date: { source: "EventPresential.event_date", cond: :date, searchable: true, orderable: true },
      status: { source: "EventPresential.status", cond: :eq, searchable: false, orderable: true },
    }
  end

  private

  def data
    records.map do |record| {
        id: record.id,
        name: record.name,
        event_date: record.event_date.strftime("%d/%m/%Y"),
        status: t("event_presential.status.#{record.status}"),
        participants_number: "#{record.participants.size}/#{record.participants_number}",
        action: link_to(content_tag(:i, nil, class: 'fa fa-eye'), event_presential_admin_reports_path(record), class: 'btn btn-link btn-xs icon-action-link row-action'),
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    EventPresential.finished.all
  end
end