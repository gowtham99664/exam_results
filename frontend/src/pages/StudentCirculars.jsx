import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import circularService from '../services/circularService';
import Navbar from '../components/Navbar';
import { FaFileAlt, FaFilePdf, FaFileImage, FaCalendar } from 'react-icons/fa';

const StudentCirculars = () => {
  const navigate = useNavigate();
  const { user } = useAuth();
  const [circulars, setCirculars] = useState([]);
  const [loading, setLoading] = useState(false);
  const [filterCategory, setFilterCategory] = useState('all');

  const categories = [
    { value: 'general', label: 'General' },
    { value: 'exam', label: 'Exam' },
    { value: 'academic', label: 'Academic' },
    { value: 'admission', label: 'Admission' },
    { value: 'event', label: 'Event' },
    { value: 'urgent', label: 'Urgent' },
  ];

  useEffect(() => {
    if (user?.role !== 'student') {
      navigate('/');
      return;
    }
    fetchCirculars();
  }, [user, navigate]);

  const fetchCirculars = async () => {
    setLoading(true);
    try {
      const data = await circularService.getCirculars();
      setCirculars(data.circulars || []);
    } catch (error) {
      console.error('Failed to load circulars');
    } finally {
      setLoading(false);
    }
  };

  const getFileIcon = (fileUrl) => {
    if (!fileUrl) return <FaFileAlt />;
    if (fileUrl.endsWith('.pdf')) return <FaFilePdf className="text-red-500" />;
    if (fileUrl.match(/\.(jpg|jpeg|png)$/i)) return <FaFileImage className="text-blue-500" />;
    return <FaFileAlt />;
  };

  const getCategoryBadge = (category) => {
    const colors = {
      general: 'bg-gray-100 text-gray-800',
      exam: 'bg-blue-100 text-blue-800',
      academic: 'bg-green-100 text-green-800',
      admission: 'bg-yellow-100 text-yellow-800',
      event: 'bg-purple-100 text-purple-800',
      urgent: 'bg-red-100 text-red-800',
    };
    return colors[category] || colors.general;
  };

  const filteredCirculars = circulars.filter(circular => {
    if (filterCategory !== 'all' && circular.category !== filterCategory) return false;
    return true;
  });

  return (
    <div className="min-h-screen bg-gray-50">
      <Navbar />
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="mb-6">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Notifications & Circulars</h1>
          <p className="text-gray-600">View important announcements and notices from the university</p>
        </div>

        <div className="bg-white p-4 rounded-lg shadow mb-6">
          <label className="block text-sm font-medium text-gray-700 mb-2">Filter by Category</label>
          <select
            value={filterCategory}
            onChange={(e) => setFilterCategory(e.target.value)}
            className="border rounded-lg px-3 py-2 w-64"
          >
            <option value="all">All Categories</option>
            {categories.map(cat => (
              <option key={cat.value} value={cat.value}>{cat.label}</option>
            ))}
          </select>
        </div>

        {loading ? (
          <div className="text-center py-8">Loading circulars...</div>
        ) : filteredCirculars.length === 0 ? (
          <div className="bg-white p-8 rounded-lg shadow text-center text-gray-500">
            No circulars available at the moment
          </div>
        ) : (
          <div className="grid gap-4">
            {filteredCirculars.map(circular => (
              <div key={circular.id} className="bg-white p-6 rounded-lg shadow hover:shadow-md transition">
                <div className="flex items-start justify-between">
                  <div className="flex-1">
                    <div className="flex items-center gap-3 mb-2">
                      <h3 className="text-xl font-semibold text-gray-900">{circular.title}</h3>
                      <span className={`px-3 py-1 rounded-full text-xs font-medium ${getCategoryBadge(circular.category)}`}>
                        {circular.category.charAt(0).toUpperCase() + circular.category.slice(1)}
                      </span>
                      {circular.category === 'urgent' && (
                        <span className="text-red-600 font-semibold text-sm">URGENT</span>
                      )}
                    </div>
                    <p className="text-gray-700 mb-3 whitespace-pre-wrap">{circular.description}</p>
                    <div className="flex items-center gap-2 text-sm text-gray-500">
                      <FaCalendar />
                      <span>{circular.created_at}</span>
                    </div>
                    {circular.file_url && (
                      <div className="mt-4">
                        <a
                          href={circular.file_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="inline-flex items-center gap-2 bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700 transition"
                        >
                          {getFileIcon(circular.file_url)}
                          <span>View Attachment</span>
                        </a>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default StudentCirculars;
