import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Home from './pages/Home';
import Player from './pages/Player';
import Stats from './pages/Stats';
import Dashboard from './pages/Dashboard';
import Achievement from './pages/Achievement';
import Layout from './components/common/Layout';

const App = () => {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/player" element={<Player />} />
          <Route path="/stats" element={<Stats />} />
          <Route path="/achievement" element={<Achievement />} />
        </Routes>
      </Layout>
    </Router>
  );
};

export default App;
