import React from 'react';
import { useNavigate } from 'react-router-dom';
import Layout from '../components/common/Layout';

const Home = () => {
    const navigate = useNavigate();

    const handleNavigate = (path) => {
        navigate(path);
    };

    return (
          <div className="flex flex-col items-center justify-center h-screen p-4 text-center">
              <h1 className="text-4xl font-bold mb-4">Game Analytics Dashboard</h1>
              <p className="text-lg mb-8 max-w-2xl">
                  An interactive platform for querying and analyzing gaming data. 
                  View top players and their achievements, analyze playtime metrics, 
                  and manage player profiles with dynamic database operations.
              </p>

              <div className="space-y-4 mb-8">
                  <h2 className="text-xl font-semibold">Key Features:</h2>
                  <ul className="list-disc text-left mx-auto inline-block">
                      <li>View top players and their unlocked achievements</li>
                      <li>Analyze average playtime and achievement statistics</li>
                      <li>Track player activity over time</li>
                      <li>Update player profiles and manage data</li>
                  </ul>
              </div>

              {/* Navigation Buttons */}
              <div className="flex gap-6">
                  <button 
                      onClick={() => handleNavigate('/player')}
                      className="bg-blue-500 hover:bg-blue-600 text-white px-6 py-3 rounded-lg font-medium transition-colors"
                  >
                      Players
                  </button>
                  <button 
                      onClick={() => handleNavigate('/stats')}
                      className="bg-green-500 hover:bg-green-600 text-white px-6 py-3 rounded-lg font-medium transition-colors"
                  >
                      Statistics
                  </button>
                  <button 
                      onClick={() => handleNavigate('/achievement')}
                      className="bg-purple-500 hover:bg-purple-600 text-white px-6 py-3 rounded-lg font-medium transition-colors"
                  >
                      Achievements
                  </button>
              </div>
          </div>
    );
};

export default Home;
