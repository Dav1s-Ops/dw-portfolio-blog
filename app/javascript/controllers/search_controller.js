import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["table"]

  filter(event) {
    const searchTerm = event.target.value.toLowerCase()
    const rows = document.querySelectorAll("tbody tr")

    rows.forEach(row => {
      const title = row.dataset.postTitle
      if (title.includes(searchTerm)) {
        row.style.display = ""
      } else {
        row.style.display = "none"
      }
    })
  }
}