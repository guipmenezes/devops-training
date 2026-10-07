// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import confetti from "canvas-confetti"

// Explosão de confetti quando uma tarefa é criada (flash :confetti vindo do redirect).
document.addEventListener("turbo:load", () => {
  if (document.querySelector("[data-confetti='true']")) {
    fireConfetti()
  }
})

function fireConfetti() {
  const colors = ["#6c5ce7", "#a29bfe", "#fd79a8", "#fdcb6e", "#55efc4"]

  confetti({ particleCount: 90, spread: 75, origin: { y: 0.6 }, colors })
  setTimeout(() => confetti({ particleCount: 45, angle: 60, spread: 60, origin: { x: 0, y: 0.7 }, colors }), 150)
  setTimeout(() => confetti({ particleCount: 45, angle: 120, spread: 60, origin: { x: 1, y: 0.7 }, colors }), 150)
}
