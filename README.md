# RobloxGameDev
Creative exploration of Game development as a student, slowly into a developer.


# 🏗️ Roblox 2D Truss Simulator (Tech Demo)

**A 2D bridge-building and physics simulator built in Roblox Studio, exploring the intersection of computer science and structural engineering.**

![]

This project is a tech demo and a personal learning journey to build a physics-based game. The goal is to create a simple, stable, and fun sandbox where players can build truss structures and test their integrity against a physical load.

---

## 💡 The Inspiration (The "Why")

This project is more than just a game; it's the first major step in merging my two biggest professional interests: Computer Science and Structural Engineering.

I recently wrote an article, **"Dreams Deferred, Not Denied: Finding New Purpose Through Computer Science,"** which explains my journey and the "why" behind this passion. This simulator is the first technical expression of that idea—bringing an engineering dream to life through code.

**[Read the full story on Medium](https://medium.com/@eugene.onyiodhis/dreams-deferred-not-denied-finding-new-purpose-through-computer-science-ab51216b83fd)**

---

## 🛠️ Tech Stack

* **Engine:** Roblox Studio
* **Language:** Luau
* **Physics:** Roblox's built-in physics engine, using `SpringConstraint`s to simulate beam stress (tension and compression).
* **Tools:** `UserInputService` for controls, `ClickDetector`s for interaction, and `RemoteEvent`s for client-server communication.

---

## 🎯 Current Features

As a tech demo, the current focus is on the core loop:

* **Build Mode:** Players can place "Joint" (Parts) and "Beams" (`SpringConstraint`s) on a 2D plane.
* **Budget System:** [Add this when you build it: e.g., "Building joints and beams costs from a limited budget."]
* **Test Mode:** A "Test" button that un-anchors the bridge and spawns a load (a heavy part) to test its strength.
* **Physics Failure:** Beams (Springs) will break and disappear when they exceed their `MAX_STRESS` threshold.

---

## 🗺️ Project Roadmap

This is a work in progress. Future goals include:

* [ ] Refining the stress visuals (e.g., beams turning red under load).
* [ ] Creating a simple UI for budget and build tools.
* [ ] Adding multiple levels with different gaps and anchor points.
* [ ] [Your own idea here]

---

## 🚀 Getting Started

[Add simple steps for how someone could test it, e.g.:]
1.  Open the project in Roblox Studio.
2.  Run the `Main` scene.
3.  Click the "Add Joint" button to place nodes.
4.  Click the "Add Beam" button and click two joints to connect them.
5.  Click the "Test" button to see if it holds!